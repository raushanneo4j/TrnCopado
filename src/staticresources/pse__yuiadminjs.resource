var _AssociatePopupHandler = {
	overlay : null,
	overlayContainer : null, 
	overlayEscKeyHandle : null,
	prepare : function () {
	    /* Create Overlay from script, this time. With no footer */
	    _AssociatePopupHandler.overlay = new _yui.Overlay({
	        contentBox : "#associateOverlay", 
	        width : "60%",
	        zIndex:2
	    });
	    
	    /* Center overlay in viewport */
	    _AssociatePopupHandler.overlay.set("centered", true);
	    
	    _AssociatePopupHandler.overlay.render();
	    _AssociatePopupHandler.overlay.show();
	    _AssociatePopupHandler.overlayContainer = _yui.one('#associateOverlayContainer'); 
	},
	
    attachEscKey : function () 
    {
       _AssociatePopupHandler.overlayEscKeyHandle = _yui.on('key', _AssociatePopupHandler.hide, document, 'down:27', _yui);
    },
    
    detachEscKey : function ()
    {
       _AssociatePopupHandler.overlayEscKeyHandle.detach();
    },
    
    show : function () {
 
        validateZIndexForOverlay(true);
        _yui.one('#associateOverlay .overlayBody').setStyle('width','600px');
        _yui.one('#associateHeader').setStyle('width','630px');
    	_yui.one('#associateOverlay .overlayBody').setStyle('overflow', 'auto');
 	    _AssociatePopupHandler.overlayContainer.setStyle('display', 'block');
	    _AssociatePopupHandler.overlay.set("centered", true);
	    stablizeOverlay(_AssociatePopupHandler.overlay);
	    _AssociatePopupHandler.attachEscKey();
    },
    
    hide : function() {
	    _AssociatePopupHandler.overlayContainer.setStyle('display', 'none');
	    _AssociatePopupHandler.detachEscKey();
	    validateZIndexForOverlay(false);
    }
}

var _AssociatePopupHandler4Deactivate = {
	overlay : null,
	overlayContainer : null, 
	overlayEscKeyHandle : null,
	prepare : function () {
	    /* Create Overlay from script, this time. With no footer */
	    _AssociatePopupHandler4Deactivate.overlay = new _yui.Overlay({
	        contentBox : "#associateOverlay4Deactivate", 
	        width : "60%",
	        zIndex:2
	    });
	    
	    /* Center overlay in viewport */
	    _AssociatePopupHandler4Deactivate.overlay.set("centered", true);
	    
	    _AssociatePopupHandler4Deactivate.overlay.render();
	    _AssociatePopupHandler4Deactivate.overlay.show();
	    _AssociatePopupHandler4Deactivate.overlayContainer = _yui.one('#associateOverlayContainer4Deactivate'); 
	},
	
    attachEscKey : function () 
    {
       _AssociatePopupHandler4Deactivate.overlayEscKeyHandle = _yui.on('key', _AssociatePopupHandler4Deactivate.hide, document, 'down:27', _yui);
    },
    
    detachEscKey : function ()
    {
       _AssociatePopupHandler4Deactivate.overlayEscKeyHandle.detach();
    },
    
    show : function () {
 
        validateZIndexForOverlay(true);
        _yui.one('#associateOverlay4Deactivate .overlayBody').setStyle('width','400px');
        _yui.one('#associateHeader').setStyle('width','515px');
    	_yui.one('#associateOverlay4Deactivate .overlayBody').setStyle('overflow', 'auto');
 	    _AssociatePopupHandler4Deactivate.overlayContainer.setStyle('display', 'block');
	    _AssociatePopupHandler4Deactivate.overlay.set("centered", true);
	    stablizeOverlay(_AssociatePopupHandler4Deactivate.overlay);
	    _AssociatePopupHandler4Deactivate.attachEscKey();
    },
    
    hide : function() {
	    _AssociatePopupHandler4Deactivate.overlayContainer.setStyle('display', 'none');
	    _AssociatePopupHandler4Deactivate.detachEscKey();
	    validateZIndexForOverlay(false);
    }
}