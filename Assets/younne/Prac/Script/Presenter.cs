using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Younne
{
    public class Presenter
    {
        private UIView uiView;

        public Presenter(string prefabName)
        {
            uiView = new UIView(prefabName);
            uiView.CreateUI();
        }
    }
}
