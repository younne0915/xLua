using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

namespace Younne
{
    public delegate void OnVoidDel();
    public delegate void OnPagramUIViewDel(UIView view);

    public delegate void CreateLuaUIDel(string name,
        out OnVoidDel onInitDel, out OnPagramUIViewDel onCreatedDel,
        out OnVoidDel onEnableDel, out OnVoidDel onDisableDel,
        out OnVoidDel onDestroyDel);


    [Hotfix]
    [GCOptimize]
    public partial class UIManager : MonoBehaviour
    {
        public static UIManager Instance = null;
        static CreateLuaUIDel _createLuaUIDel;
        
        string _prefabName;

        private void Awake()
        {
            Instance = this;
        }

        public static GameObject OpenUI(string prefabName)
        {
            return Instantiate(Resources.Load<GameObject>(prefabName));
        }
        
        public static void OpenUIForLua(string prefabName)
        {
            if (_createLuaUIDel != null)
            {
                OnVoidDel onInitDel;
                OnPagramUIViewDel onCreatedDel;
                OnVoidDel onEnableDel;
                OnVoidDel onDisableDel;
                OnVoidDel onDestroyDel;

                _createLuaUIDel(prefabName, out onInitDel,
                    out onCreatedDel, out onEnableDel,
                    out onDisableDel, out onDestroyDel);

                LuaPresenter presenter = new LuaPresenter(prefabName);
                presenter.SetLuaEvent(onCreatedDel, onEnableDel, onDisableDel, onDestroyDel);
                presenter.Initialize();
            }
        }

        public static void Init(CreateLuaUIDel createLuaUIDel)
        {
            _createLuaUIDel = createLuaUIDel;
        }
    }
}
