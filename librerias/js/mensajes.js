/*mostrar mensajes simples para confirmar o alertar al usuario*/
function dataMessage(tipo,msj){
	toastr.options = {
    "closeButton": false, // true/false
    "debug": false, // true/false
    "newestOnTop": false, // true/false
    "progressBar": true, // true/false
    "positionClass": "toast-bottom-right", // toast-top-right / toast-top-left / toast-bottom-right / toast-bottom-left
    "preventDuplicates": true,
    "onclick": null,
    "showDuration": "300", // in milliseconds
    "hideDuration": "1000", // in milliseconds
    "timeOut": "5000", // in milliseconds
    "extendedTimeOut": "1000", // in milliseconds
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}
	Command: toastr[""+tipo+""](""+msj+"");
	// cuerpoMessage();
}


