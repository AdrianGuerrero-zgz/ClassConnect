/* LOGIN */
function idiomaEN() {
    if (document.getElementById("userLabel")) {
        document.getElementById("userLabel").innerText = "Username";
        document.getElementById("passLabel").innerText = "Password";
        document.getElementById("loginBtn").innerText = "Log in";
        document.getElementById("noAccount").innerText = "Don't have an account?";
        document.getElementById("registerLink").innerText = "Sign up";
    }
}

function idiomaES() {
    if (document.getElementById("userLabel")) {
        document.getElementById("userLabel").innerText = "Usuario";
        document.getElementById("passLabel").innerText = "Contraseña";
        document.getElementById("loginBtn").innerText = "Iniciar sesión";
        document.getElementById("noAccount").innerText = "¿No tienes cuenta?";
        document.getElementById("registerLink").innerText = "Regístrate";
    }
}

/* REGISTRO */
function registroEN() {
    if (document.getElementById("titleRegister")) {
        document.getElementById("titleRegister").innerText = "Register";
        document.getElementById("userReg").innerText = "Username";
        document.getElementById("emailReg").innerText = "Email";
        document.getElementById("passReg").innerText = "Password";
        document.getElementById("btnReg").innerText = "Sign up";
        document.getElementById("haveAccount").innerText = "Already have an account?";
        document.getElementById("loginLink").innerText = "Log in";
    }
}

function registroES() {
    if (document.getElementById("titleRegister")) {
        document.getElementById("titleRegister").innerText = "Registro";
        document.getElementById("userReg").innerText = "Usuario";
        document.getElementById("emailReg").innerText = "Correo electrónico";
        document.getElementById("passReg").innerText = "Contraseña";
        document.getElementById("btnReg").innerText = "Registrarse";
        document.getElementById("haveAccount").innerText = "¿Ya tienes cuenta?";
        document.getElementById("loginLink").innerText = "Iniciar sesión";
    }
}