using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Younne
{
    public class LanchView : MonoBehaviour
    {
        public Button oldBtn;
        public Button newBtn;

        TipsView _tipsView;

        // Start is called before the first frame update
        void Awake()
        {
            oldBtn.onClick.AddListener(OldBtnClick);
            newBtn.onClick.AddListener(NewBtnClick);
        }

        void OldBtnClick()
        {
            if (_tipsView != null)
            {
                DestroyImmediate(_tipsView.gameObject);
                _tipsView = null;
            }

            GameObject obj = UIManager.OpenUI("TipsView");
            _tipsView = obj.GetComponent<TipsView>();
            _tipsView.SetTips();
        }

        void NewBtnClick()
        {
            //string path = "require 'UI/Presenter/FirstLuaPresenter'; New()";
            //LuaManager.Instance.DoString(path);

            string scriptText = @"require('Hotfix/Hotfix')";
            LuaManager.Instance.DoString(scriptText);
        }
    }

}