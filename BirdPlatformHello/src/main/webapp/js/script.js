/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



/**/


// function showEditModal() {
//     const modal = document.getElementById('editModal');
//     modal.style.display = 'block';

//     // Fill the input fields with current values
//     const username = document.getElementById('username');
//     const phone = document.getElementById('phone');
//     const address = document.getElementById('address');

//     document.getElementById('editUsername').value = username.textContent;
//     document.getElementById('editPhone').value = phone.textContent;
//     document.getElementById('editAddress').value = address.textContent;
//   }

//   function hideEditModal() {
//     const modal = document.getElementById('editModal');
//     modal.style.display = 'none';
//   }

//   function updateUserInfo() {
//     const username = document.getElementById('username');
//     const phone = document.getElementById('phone');
//     const address = document.getElementById('address');

//     const editedUsername = document.getElementById('editUsername').value;
//     const editedPhone = document.getElementById('editPhone').value;
//     const editedAddress = document.getElementById('editAddress').value;

//     username.textContent = editedUsername;
//     phone.textContent = editedPhone;
//     address.textContent = editedAddress;

//     hideEditModal();
//   }

//   function saveChanges() {
//     const modal = document.getElementById('editModal');
//     const editBtn = document.querySelector('.edit-btn');
//     const saveBtn = document.querySelector('.save-btn');

//     modal.style.display = 'none';
//     editBtn.style.display = 'block';
//     saveBtn.style.display = 'none';
//   }


function showAddressModal() {
    const addressModal = document.getElementById('addressModal');
    addressModal.style.display = 'block';

    // Fill the user information in the address modal
    const username = document.getElementById('userInfoUsername').textContent;
    const phone = document.getElementById('userInfoPhone').textContent;
    const address = document.getElementById('userInfoAddress').textContent;

    document.getElementById('username').textContent = username;
    document.getElementById('phone').textContent = phone;
    document.getElementById('address').textContent = address;

    // Clear the address list
    const addressList = document.getElementById('addressList');
    addressList.innerHTML = '';

    // Display the addresses
    const savedAddresses = getUserAddresses();
    savedAddresses.forEach((address) => {
        const listItem = document.createElement('li');
        listItem.textContent = address;
        addressList.appendChild(listItem);
    });
}

function AddAddressModal() {
    const addModal = document.getElementById('addModal');
    addModal.style.display = 'block';

    // Fill the user information in the address modal
    const username = document.getElementById('userInfoUsername').textContent;
    const phone = document.getElementById('userInfoPhone').textContent;
    const address = document.getElementById('userInfoAddress').textContent;

    document.getElementById('addUsername').textContent = username;
    document.getElementById('addPhone').textContent = phone;
    document.getElementById('addAddress').textContent = address;

    // Clear the address list
}
function hideAddAddressModal() {
    const addModal = document.getElementById('addModal');
    addModal.style.display = 'none';
}


function showEditModal() {
    const editModal = document.getElementById('editModal');
    editModal.style.display = 'block';

    // Fill the input fields with current values
    const username = document.getElementById('userInfoUsername').textContent;
    const phone = document.getElementById('userInfoPhone').textContent;
    const address = document.getElementById('userInfoAddress').textContent;

    document.getElementById('editUsername').value = username;
    document.getElementById('editPhone').value = phone;
    document.getElementById('editAddress').value = address;
}

function hideEditModal() {
    const editModal = document.getElementById('editModal');
    editModal.style.display = 'none';
}

//

//

function updateUserInfo() {
    const username = document.getElementById('userInfoUsername');
    const phone = document.getElementById('userInfoPhone');
    const address = document.getElementById('userInfoAddress');

    const editedUsername = document.getElementById('editUsername').value;
    const editedPhone = document.getElementById('editPhone').value;
    const editedAddress = document.getElementById('editAddress').value;

    const addUsername = document.getElementById('addUsername').value;
    const addPhone = document.getElementById('addPhone').value;
    const addAddress = document.getElementById('addAddress').value;

    username.textContent = editedUsername;
    phone.textContent = editedPhone;
    address.textContent = editedAddress;

    username.textContent = addUsername;
    phone.textContent = addPhone;
    address.textContent = addAddress;

    hideEditModal();
}

function saveUserInfo() {
    const addressModal = document.getElementById('addressModal');
    addressModal.style.display = 'none';

    // Save the updated user information
    const username = document.getElementById('userInfoUsername').textContent;
    const phone = document.getElementById('userInfoPhone').textContent;
    const address = document.getElementById('userInfoAddress').textContent;

    // Save the address to the list
    const addressList = document.getElementById('addressList');
    const newAddress = document.createElement('li');
    newAddress.textContent = address;
    addressList.appendChild(newAddress);

    // Clear the input fields
    document.getElementById('editUsername').value = '';
    document.getElementById('editPhone').value = '';
    document.getElementById('editAddress').value = '';

    // Clear the input fields
    document.getElementById('addUsername').value = '';
    document.getElementById('addPhone').value = '';
    document.getElementById('addAddress').value = '';
    const selectedAddress = document.querySelector('input[name="information"]:checked').value;
    document.getElementById('userInfoAddress').textContent = selectedAddress;
}

function getUserAddresses() {
    // In this example, we use a hardcoded array as a placeholder
    // You can replace this with your own logic to fetch the addresses from a database or an API
    return [

    ];
}

function showAddFBForm() {
    var addFBForm = document.getElementById("AddFBform");
    addFBForm.style.display = "block";
    addFBForm.style.opacity = 1;
    addFBForm.style.transform = "translateY(0)";
}


function HiddenAddFBForm() {
    var addFBForm = document.getElementById("AddFBform");
    addFBForm.style.display = "none";
}


