ClassicEditor
.create( document.querySelector( '#editor' ) )
.then(editor => {
    theEditor = editor;
  })
.catch( error => {
console.error( error );
} );
$("#btnSignin").on("click", function () {
    $(".signin").css("display", "block");
});
$("#btnSignup").on("click", function () {
    $(".signup").css("display", "block");
});
$("#btnProfile").on("click", function () {
    $("#profile").css("display", "block");
});
$("#info").on("click", function () {
    $("#infomation").css("display", "block");
});

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == document.getElementById("signin")) {
        $("#signin").css("display", "none");
    }
    if (event.target == document.getElementById("signup")) {
        $("#signup").css("display", "none");
    }
    if (event.target == document.getElementById("profile")) {
        $("#profile").css("display", "none");
    }
    if (event.target == document.getElementById("infomation")) {
        $("#infomation").css("display", "none");
    }
}


$(function () {

    var links = $('.sidebar-links > a');

    links.on('click', function () {

        links.removeClass('selected');
        $(this).addClass('selected');

    })
});

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("btnBackToTop").style.display = "block";
    } else {
        document.getElementById("btnBackToTop").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}