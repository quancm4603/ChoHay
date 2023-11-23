function togglePasswordVisibility() {
            var passwordField = document.getElementById("password");
            var confirmPasswordField = document.getElementById("confirmPassword");
            var showPasswordCheckbox = document.getElementById("showPassword");

            if (showPasswordCheckbox.checked) {
                passwordField.type = "text";
                confirmPasswordField.type = "text";
            } else {
                passwordField.type = "password";
                confirmPasswordField.type = "password";
            }
        }

function checkPassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var message = document.getElementById("passwordMatchMessage");

            if (password === confirmPassword) {
                message.innerHTML = "Mật khẩu khớp nhau!";
                message.style.color = "green";
            } else {
                message.innerHTML = "Mật khẩu không khớp. Vui lòng nhập lại.";
                message.style.color = "red";
            }
        }