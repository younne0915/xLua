using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Younne
{
    public class Presenter
    {
        public UIView uiView
        {
            get;
            private set;
        }

        public Presenter(string prefabName)
        {
            uiView = new UIView(prefabName);
        }

        public virtual void Initialize()
        {

        }
    }
}
