const QRModal = new bootstrap.Modal('#QRModal', {})

const title =  "Track QR";
const msgBox = ( msg, type) =>{
    Swal.fire({
        title: title,
        text: msg,
        icon: type,
        draggable: true
    });
} 

const confirm  = ( msg ) => {
    Swal.fire({
    title: title,
    text: msg,
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Aceptar",
    cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
           msgBox('Eliminado', 'success')
        }
    });
}
const editQR = () => {
    msgBox('Editando', 'info')
}


const deleteQR = () => {
    confirm('¿Eliminar el QR?')
}

const openModal = () => {
    QRModal.show();
}