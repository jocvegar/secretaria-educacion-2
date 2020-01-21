var changeCheckboxToSwitch = function() {
	// https://www.bootstraptoggle.com/
	$('.toggle').bootstrapToggle({
		offstyle: 'danger',
		on: "SI",
		off: "NO"
	});
};

document.addEventListener("turbolinks:load", function () {
	changeCheckboxToSwitch();

	$('body').on('reLoadJS', function() {
		changeCheckboxToSwitch();
	});
});
