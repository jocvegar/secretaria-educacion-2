var addFlatPickrToClass = function() {
	$(".flatpickr").flatpickr({
		altInput: true,
		altFormat: "j F, Y",
		dateFormat: "Y-m-d",
	});
};

document.addEventListener("turbolinks:load", addFlatPickrToClass);

document.addEventListener("turbolinks:load", function () {
	$('body').on("reLoadJS", addFlatPickrToClass);
});
