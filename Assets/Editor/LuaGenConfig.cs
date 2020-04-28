using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public static class LuaGenConfig
{
    [LuaCallCSharp]
    public static List<Type> lua_call_cs_list = new List<Type>()
    {
        typeof(UnityEngine.SceneManagement.SceneManager),
        typeof(UnityEngine.SceneManagement.LoadSceneMode),
        typeof(UnityEngine.Application),
        typeof(UnityEngine.Object),
        typeof(Vector2),
        typeof(Vector3),
        typeof(Vector4),
        typeof(Quaternion),
        typeof(Color),
        typeof(Ray),
        typeof(Bounds),
        typeof(Ray2D),
        typeof(Time),
        typeof(GameObject),
        typeof(Component),
        typeof(Behaviour),
        typeof(Transform),
        typeof(Resources),
        typeof(TextAsset),
        typeof(Keyframe),
        typeof(AnimationCurve),
        typeof(AnimationClip),
        typeof(MonoBehaviour),
        typeof(ParticleSystem),
        typeof(SkinnedMeshRenderer),
        typeof(Renderer),
        typeof(WWW),
        //typeof(Light),
        typeof(Mathf),
        typeof(UnityEngine.Debug),
        typeof(UnityEngine.Rect),
        typeof(RectTransform),
        typeof(UnityEngine.UI.RectMask2D),
        typeof(UnityEngine.UI.Text),
        typeof(Sprite),
        typeof(UnityEngine.UI.Image),
        typeof(UnityEngine.UI.Button),
        typeof(UnityEngine.UI.Slider),
        typeof(UnityEngine.UI.InputField),
        typeof(UnityEngine.UI.Scrollbar),
        typeof(UnityEngine.UI.Toggle),
        typeof(UnityEngine.UI.ToggleGroup),
        typeof(UnityEngine.MonoBehaviour),


        typeof(System.Collections.Generic.List<int>),
        typeof(Action<string>),
        typeof(System.Object),

        typeof(Younne.UIManager),
        typeof(Younne.UIView),
    };


    //C#静态调用Lua的配置（包括事件的原型），仅可以配delegate，interface
    [CSharpCallLua]
    public static List<Type> cstolua = new List<Type>()
    {
        typeof(Action),
        typeof(Func<double, double, double>),
        typeof(Action<string>),
        typeof(Action<double>),
        typeof(UnityEngine.Events.UnityAction),
        typeof(System.Collections.IEnumerator),

        typeof(Younne.OnVoidDel),
        typeof(Younne.OnPagramUIViewDel),
        typeof(Younne.CreateLuaUIDel),
    };
}
