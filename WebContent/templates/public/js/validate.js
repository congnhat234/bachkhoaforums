$(document).ready(function() {
	$("#formlienhe").validate({
		ignore: [], 
		debug: false,
		rules: {
			hoten: {
				required: true,
				minlength: 6,
				maxlength: 32,
			},
			email: {
				required: true,
				minlength: 6,
				email: true,
			},
			phone: {
				required: true,
				number: true,
				minlength: 10,
			},
			noidung: {
				required: true,
				minlength: 6,
			}
		},
		messages: {
			hoten: {
				required: "Vui lòng nhập vào đây",
				minlength: "Tối thiểu là 6 ký tự",
				maxlength: "Tối đa 32 ký tự",
			},
			email: {
				required: "Vui lòng nhập vào đây",
				minlength: "Tối thiểu là 6 ký tự",
				email: "Vui lòng nhập đúng định dạng email",
			},
			phone: {
				required: "Vui lòng nhập vào đây!",
				number: "Vui lòng nhập số",
				minlength: "Tối thiểu là 10 chữ số",
			},
			noidung: {
				required: "Vui lòng nhập vào đây",
				minlength: "Tối thiểu là 6 ký tự",
			}
		}
	});
}
);