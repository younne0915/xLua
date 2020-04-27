using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

[System.Serializable]
public class Injection
{
    public string name;
    public GameObject value;
}

public class PropertyChangedEventArgs
{
    public string name;
    public object value;
}

[CSharpCallLua]
public interface YounneBland
{
    object this[int index] { get; set; }

    event EventHandler<PropertyChangedEventArgs> PropertyChangeds;
}

//[LuaCallCSharp]
public class YounneLuaBehaviour : MonoBehaviour
{
    public TextAsset luaScript;
    public TextAsset buttonScript;
    public Injection[] injections;

    internal static LuaEnv luaEnv = new LuaEnv();

    // Start is called before the first frame update
    void Start()
    {
        LuaTable temp = luaEnv.NewTable();
        LuaTable scripTable = luaEnv.NewTable();
        scripTable.SetMetaTable(temp);
        temp.Set("__index", luaEnv.Global);
        temp.Dispose();

        scripTable.Set("self", this);

        luaEnv.DoString(luaScript.text, "YounneLuaScript", scripTable);
        Action luaRun = scripTable.Get<Action>("luaRun");
        if (luaRun != null)
        {
            luaRun();
        }

        YounneBland bland;
        scripTable.Get("bland", out bland);
        Debug.LogErrorFormat("bland = {0}", bland[0]);

        bland.PropertyChangeds += (object sender, PropertyChangedEventArgs ea) =>
        {
            Debug.LogErrorFormat("bland property change");
        };

        bland[0] = 1;

        luaEnv.DoString(buttonScript.text, "buttonScript", scripTable);

        foreach (var injection in injections)
        {
            scripTable.Set(injection.name, injection.value);
        }

        Action btnListerner = scripTable.Get<Action>("luaAddBtnListner");
        if (btnListerner != null)
        {
            btnListerner();
        }

    }

    //[LuaCallCSharp]
    public void Run()
    {
        Debug.LogErrorFormat("younne run");
    }
}
