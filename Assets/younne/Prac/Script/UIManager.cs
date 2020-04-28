using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

namespace Younne
{
    public delegate void OnInitDel();
    public delegate void OnCreatedDel(View view);
    public delegate void OnEnableDel();
    public delegate void OnDisableDel();
    public delegate void OnDestroyDel();

    public delegate void CreateLuaUIDel(string name, 
        out OnInitDel onInitDel , out OnCreatedDel onCreatedDel,
        out OnEnableDel onEnableDel, out OnDisableDel onDisableDel, 
        out OnDestroyDel onDestroyDel);

    [Hotfix]
    [GCOptimize]
    [LuaCallCSharp]
    public class UIManager : MonoBehaviour
    {
        public static UIManager Instance = null;
        private CreateLuaUIDel _createLuaUIDel;

        private void Awake()
        {
            Instance = this;
        }

        public GameObject OpenUI(string prefabName)
        {
            return Instantiate(Resources.Load<GameObject>(prefabName));
        }
        
        public void OpenUIForLua(string prefabName)
        {
            LuaPresenter presenter = new LuaPresenter(prefabName);
            
        }

        public void Init(CreateLuaUIDel createLuaUIDel)
        {
            _createLuaUIDel = createLuaUIDel;

        }
    }
}
