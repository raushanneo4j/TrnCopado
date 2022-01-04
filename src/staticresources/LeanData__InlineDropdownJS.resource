/*
    This static resource is a generalised js logic that returns html of an inline dropdown.
    For example of usage, refers to DashboardANMappedAccountFields.

    To use it,
    include both this InlineDropdownJS and InlineDropdownCSS static resources
    call generateDropdown in jquery append and
    call bindDropdownListener right after every jquery append
*/

function generateDropdown(id, array) {
    var dropdown = '<div class="dropdown width-fill dropdown-border" style="width:75%;">';
    dropdown += '<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" id="'+id+'" style="padding-left:3px; padding-top:3px; display:flex;"><span class="dropdown-selection" data-value="null">--None--</span>';
    dropdown += '<span class="ld-caret"></span></div>';
    dropdown += '<ul class="dropdown-menu dropdown-scroll">';
    dropdown += generateSubmenu(array, null, null, (id=='custom_lead_field_dropdown'));
    return dropdown;
}

function generateSubmenu(array, parentValue, parentLabel, singleDropdownFlag) {
    array.sort(sortDropdownArray);
    var submenu = '';
    for (var i = 0; i < array.length; i++) {
        var key = array[i]['label'];
        var value = array[i]['name'];
        var label = key;
        if (parentValue) {
            if (value=='id') value = parentValue;
            else value = flatten('value', parentValue) + '.' + value;
        }
        if (parentLabel) label = flatten('label', parentLabel) + '.' + key;
        var childType = array[i]['parent'][0];
        if (!singleDropdownFlag && childType && childType.length>0)
            submenu += '<li class="dropdown-list dropdown-expandable" data-parent="'+childType+'" data-value="'+value+'" data-label="'+label+'"><span class="expand-trigger">'+key+'<span class="expand-arrow">&#x25B8</span></span><ul class="nested-menu"></ul></li>';
        else submenu += '<li class="dropdown-list change-parameter-dropdown" data-label="'+label+'" data-value="'+value+'"><span>'+key+'</span></li>';
    }
    return submenu;
}

function bindDropdownListener() {
    j$('li.dropdown-expandable .expand-trigger').off('click');
    j$('ul.dropdown-menu li.change-parameter-dropdown').off('click');
    j$('li.dropdown-expandable .expand-trigger').on('click', function(e){
        var $currentTarget = j$(e.currentTarget);
        var $nestedDropdown = j$($currentTarget).next();
        if (j$($nestedDropdown).hasClass("open")) {
            j$($nestedDropdown).removeClass("open");
            $currentTarget.find(".expand-arrow").text("\u25B8");
        } else {
            if (j$($nestedDropdown).find("li") && j$($nestedDropdown).find("li").length == 0) {
                var parentLabel = j$($currentTarget).parent().data("label");
                var parentValue = j$($currentTarget).parent().data("value");
                var parentType = j$($currentTarget).parent().data("parent");
                j$($nestedDropdown).append(generateSubmenu(fields[parentType], parentValue, parentLabel));
                bindDropdownListener();
            }
            j$($nestedDropdown).addClass("open");
            $currentTarget.find(".expand-arrow").text("\u25BE");
        }
        var sibling_dropdowns = j$($nestedDropdown).parent().siblings(".dropdown-expandable");
        sibling_dropdowns.find(".nested-menu").removeClass("open");
        sibling_dropdowns.find(".expand-arrow").text("\u25B8");
        event.stopPropagation();
    });
    j$('ul.dropdown-menu li.change-parameter-dropdown').on('click', function(e){
        var value = j$(e.currentTarget).data('value');
        var label = j$(e.currentTarget).data('label');
        var $parent = j$(e.currentTarget).closest('div.dropdown-border');
        var $selection = j$($parent).find('span.dropdown-selection').first();
        $selection.html(label);
        $selection[0].dataset.value = value;
    });
}

function sortDropdownArray(a, b) {
    if (a['label'].toUpperCase() > b['label'].toUpperCase()) return 1;
    else if (a['label'].toUpperCase() < b['label'].toUpperCase()) return -1;
    else return 0;
}

function flatten(type, name) {
    if (type=='label') return name.replace(' ID', '');
    else if (type=='value') {
        var newApiName = name.replace('__c', '__r'); 
        if (newApiName === name) {
            newApiName = newApiName.replace('id', '');
        } 
        return newApiName;
    }
}