/* dropdown */
.bs .dropdown-submenu {
    position: relative;
}
.bs .dropdown-submenu .dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -1px;
}
.width-fill {
    -webkit-box-sizing: border-box; 
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    width: 100%;
}
.dropdown-border{
    outline: 1px solid #9eb7cb;
    margin-top:1px;
    min-height:20px;
}
.bs .dropdown-menu {
    font-size: 10px;
    font-weight: 400;
    line-height: 20px;
}
.dropdown-scroll {
    overflow:auto;
    max-height:285px;
    width:initial;
}
.expand-trigger {
    display: block;
}
.dropdown-expandable .nested-menu {
    list-style-type: none;
    padding-left: 10px;
    transition: max-height 0.35s ease-out;
    max-height: 0;
    overflow:auto;
}
li.dropdown-expandable .nested-menu.open{
    max-height: 500px;
    transition: max-height 0.5s ease-in;
}
.nested-menu{
    background:white;
}
.nested-menu li:hover{
    background:#eeeeee;
}
.dropdown-border{
    outline: 1px solid #9eb7cb;
    margin-top:1px;
    min-height:20px;
}
.dropdown-list{
    padding-left: 3px;
}
.dropdown-selection{
    flex: 1;
    cursor: pointer;
}