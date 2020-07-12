App = {
    init: function() {
        console.log("App Initialized")
    }
}

$(function() {
    $(window).load(function() {
        App.init();
    })
});