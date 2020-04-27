using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

namespace Younne
{
    public class LuaViewBehaviour : MonoBehaviour
    {
        private string prefabName;

        [CSharpCallLua]
        public delegate void delLuaAwake(GameObject obj);
        private delLuaAwake luaAwake;

        [CSharpCallLua]
        public delegate void delLuaStart();
        private delLuaStart luaStart;

        [CSharpCallLua]
        public delegate void delLuaUpdate();
        private delLuaUpdate luaUpdate;

        [CSharpCallLua]
        public delegate void delLuaOnDestroy();
        private delLuaOnDestroy luaOnDestroy;

        public void Init(string name)
        {
            prefabName = name;

            try
            {
                LuaTable meta = LuaManager.NewTable();
                LuaTable scriptEnv = LuaManager.NewTable();
                scriptEnv.SetMetaTable(meta);
                meta.Set("__index", LuaManager.Global);
                LuaManager.DoString(string.Format("require '{0}'", name), prefabName, scriptEnv);
                luaAwake = scriptEnv.GetInPath<delLuaAwake>(prefabName + ".awake");
                luaStart = scriptEnv.GetInPath<delLuaStart>(prefabName + ".start");
                luaUpdate = scriptEnv.GetInPath<delLuaUpdate>(prefabName + ".update");
                luaOnDestroy = scriptEnv.GetInPath<delLuaOnDestroy>(prefabName + ".ondestroy");

                if (luaAwake != null)
                {
                    luaAwake(gameObject);
                }
            }
            catch (Exception ex)
            {
                Debug.LogErrorFormat(ex.ToString());
            }

            
        }

        // Start is called before the first frame update
        void Start()
        {
            if (luaStart != null)
            {
                luaStart();
            }
        }

        // Update is called once per frame
        void Update()
        {
            if (luaUpdate != null)
            {
                luaUpdate();
            }
        }

        private void OnDestroy()
        {
            if (luaOnDestroy != null)
            {
                luaOnDestroy();
            }
        }
    }
}
