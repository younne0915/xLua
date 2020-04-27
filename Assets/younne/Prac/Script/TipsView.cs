using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using XLua;

namespace Younne
{
    [Hotfix]
    [LuaCallCSharp]
    public class TipsView : MonoBehaviour
    {
        public Text tipsText;

        //[Hotfix]
        public void SetTips()
        {
            tipsText.text = "Old";
        }
    }
}

