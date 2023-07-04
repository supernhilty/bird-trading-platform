function sendMailRegister() {
    var params = {
      name: document.getElementById("name").value,
      email: document.getElementById("email").value,
      message: document.getElementById("message").value,
    };
  
    const serviceID = "service_t9ukxhd";
    const templateID = "template_tem803c";
  
      emailjs.send(serviceID, templateID, params)
      .then(res=>{
          document.getElementById("name").value = "";
          document.getElementById("email").value = "";
          document.getElementById("message").value = "";
          console.log(res);
          alert("Your message sent successfully!!")
  
      })
      .catch(err=>console.log(err));
  
  }
  
  function sendMailChangeProfile() {
    var params = {
      email: document.getElementById("email").value,
      message: document.getElementById("message").value,
    };
  
    const serviceID = "service_t9ukxhd";
    const templateID = "template_99bmn7u";
  
      emailjs.send(serviceID, templateID, params)
      .then(res=>{
          document.getElementById("email").value = "";
          document.getElementById("message").value = "";
          console.log(res);
           alert("Your message sent successfully!!")
  
      })
      .catch(err=>console.log(err));
  
  }
  