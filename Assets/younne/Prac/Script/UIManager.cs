using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

namespace Younne
{
    public delegate void CreateLuaUIDelegate(string name, out );
    [Hotfix]
    [GCOptimize]
    [LuaCallCSharp]
    public class UIManager : MonoBehaviour
    {
        public static UIManager Instance = null;

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

        public void Init()
        {

        }
    }
}
