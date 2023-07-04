const inputs = document.querySelectorAll(".input-field");
const toggle_btn = document.querySelectorAll(".toggle");
const main = document.querySelector("main");
const bullets = document.querySelectorAll(".bullets span");
const images = document.querySelectorAll(".image");
const signInBtns = document.querySelectorAll(".sign-in-button");

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

toggle_btn.forEach((btn) => {
  btn.addEventListener("click", () => {
    main.classList.toggle("sign-up-mode");
  });
});

// Lấy tham chiếu đến form đăng ký
const signupForm = document.getElementById('signup-form');

// Xử lý sự kiện khi người dùng nhấp vào nút "Sign Up"
signupForm.addEventListener('submit', function(event) {
  event.preventDefault(); // Ngăn chặn việc gửi form đi

  // Thực hiện kiểm tra thông tin đăng ký tại đây
  const nameInput = signupForm.querySelector('input[name="name"]');
  const emailInput = signupForm.querySelector('input[name="email"]');
  const passwordInput = signupForm.querySelector('input[name="password"]');

  // Kiểm tra các điều kiện của thông tin đăng ký
  // Ví dụ: Kiểm tra xem tên, email, và mật khẩu có hợp lệ không
  const name = nameInput.value.trim();
  const email = emailInput.value.trim();
  const password = passwordInput.value.trim();

  if (name.length < 4 || email.length < 4 || password.length < 4) {
    // Nếu thông tin không hợp lệ, không chuyển trang và thông báo lỗi
    alert("Vui lòng nhập thông tin hợp lệ!");
  } else {
    // Nếu thông tin hợp lệ, có thể chuyển trang
    signupForm.submit();
  }
});



