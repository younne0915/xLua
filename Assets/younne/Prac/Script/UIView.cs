using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Younne
{
    public class UIView
    {
        public View view;
        public string viewName
        {
            get;
            private set;
        }

        public UIView(string prefabName)
        {
            viewName = prefabName;
        }

        public void SetTip()
        {
            Debug.LogErrorFormat("SetTip = {0}", viewName);
        }
    }
}
