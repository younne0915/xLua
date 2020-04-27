using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Younne
{
    public class UIView
    {
        public View view;
        private string _prefabName;

        public UIView(string prefabName)
        {
            _prefabName = prefabName;
        }

        public void CreateUI()
        {
            GameObject obj = GameObject.Instantiate(Resources.Load<GameObject>(_prefabName));
            view = obj.AddComponent<View>();
        }
    }
}
