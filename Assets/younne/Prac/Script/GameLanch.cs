using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using UnityEngine;
using XLua;

namespace Younne
{
    public class GameLanch : MonoBehaviour
    {
        private void Awake()
        {
            GameObject obj = Resources.Load<GameObject>("LanchView");
            Instantiate(obj);
        }
    }
}

