const form = document.querySelector('form');
const inputEmail = document.querySelector('#inputEmail');
const inputPassword = document.querySelector('#inputPassword');
const divMsg = document.querySelector('#divmsg');

form.addEventListener('submit', (event) => {
    event.preventDefault();

    if( inputEmail.value.trim() === '' || inputPassword.value.trim() === ''){
        showMsg('Complete todos los campos');
        return;
    }

    if( !inputEmail.value.includes('@')){
        showMsg('Complete con un Email Valido');
        return
    }

    location.href = 'dashboard.html';

})

inputEmail.addEventListener('focus', () => hideMsg() );
inputPassword.addEventListener('focus', () => hideMsg() );

const showMsg = ( msg) => {
    divMsg.innerHTML = `<div class="alert alert-dismissible alert-danger">
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                ${msg}
                            </div>`
}

const hideMsg = () => {
    divMsg.innerHTML = '';
}