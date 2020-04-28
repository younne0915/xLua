using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace Younne
{
    public class LuaPresenter : Presenter
    {
        OnPagramUIViewDel _onCreatedDel;
        OnVoidDel _onEnableDel;
        OnVoidDel _onDisableDel;
        OnVoidDel _onDestroyDel;

        public LuaPresenter(string name) : base(name)
        {

        }

        public override void Initialize()
        {
            base.Initialize();

            OnCreated();
            OnEnable();

            UIManager.OpenUI(uiView.viewName);
        }

        public void SetLuaEvent(OnPagramUIViewDel onCreatedDel, OnVoidDel onEnableDel,
                                OnVoidDel onDisableDel, OnVoidDel onDestroyDel)
        {
            _onCreatedDel = onCreatedDel;
            _onEnableDel = onEnableDel;
            _onDisableDel = onDisableDel;
            _onDestroyDel = onDestroyDel;
        }

        public void OnCreated()
        {
            if(_onCreatedDel != null)
            {
                _onCreatedDel(uiView);
            }
        }

        public void OnEnable()
        {
            if (_onEnableDel != null)
            {
                _onEnableDel();
            }
        }

        public void OnDisable()
        {
            if (_onDisableDel != null)
            {
                _onDisableDel();
            }
        }

        public void OnDestroy()
        {
            if (_onDestroyDel != null)
            {
                _onDestroyDel();
            }
        }
    }
}