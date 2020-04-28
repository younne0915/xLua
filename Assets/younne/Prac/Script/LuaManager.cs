using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using XLua;

namespace Younne
{
    public class LuaManager : MonoBehaviour
    {
        public static LuaManager Instance = null;

        private LuaEnv luaEnv = new LuaEnv();

        public static LuaTable Global
        {
            get
            {
                return Instance.luaEnv.Global;
            }
        }

        private StringBuilder stringBuilder = new StringBuilder();

        private void Awake()
        {
            Instance = this;
        }

        private void Start()
        {
            Init();
        }

        public void Init()
        {
            try
            {
                luaEnv.AddLoader(LoadLua);
                luaEnv.DoString("require 'main'");
            }
            catch (Exception ex)
            {
                Debug.LogErrorFormat("Exception ex = {0}", ex.ToString());
            }
        }

        private byte[] LoadLua(ref string fileName)
        {
            stringBuilder.Clear();
            stringBuilder.Append("Assets/younne/Prac/Lua/");
            stringBuilder.Append(fileName);
            stringBuilder.Append(".lua");
            return File.ReadAllBytes(stringBuilder.ToString());
        }

        public void DoString(string path)
        {
            luaEnv.DoString(path);
        }

        public static LuaTable NewTable()
        {
            return Instance.luaEnv.NewTable();
        }

        public static object[] DoString(string chunk, string chunkName = "chunk", LuaTable env = null)
        {
            return Instance.luaEnv.DoString(chunk, chunkName, env);
        }
    }
}
