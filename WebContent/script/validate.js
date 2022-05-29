
function validateInfo(textbox){
	if (textbox.validity.valueMissing) {
        textbox.setCustomValidity('Vui lòng nhập dữ liệu');
    } 
    else if(textbox.validity.tooShort) {
        textbox.setCustomValidity('Giá trị nhập quá ngắn');
    }
    else if(textbox.validity.tooLong) {
        textbox.setCustomValidity('Giá trị nhập quá dài');
    }
    else if(textbox.validity.patternMismatch) {
        textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else if(textbox.validity.typeMismatch) {
       textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else {
        textbox.setCustomValidity('');
    }
    return true;
};	


function validateRegister(textbox){
	if (textbox.validity.valueMissing) {
        textbox.setCustomValidity('Vui lòng nhập dữ liệu');
    } 
    else if(textbox.validity.tooShort) {
        textbox.setCustomValidity('Giá trị nhập quá ngắn');
    }
    else if(textbox.validity.tooLong) {
        textbox.setCustomValidity('Giá trị nhập quá dài');
    }
    else if(textbox.validity.patternMismatch) {
        textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else if(textbox.validity.typeMismatch) {
       textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else {
        textbox.setCustomValidity('');
    }
    return true;
};	


function validatePassword(textbox){
	
	if (textbox.validity.valueMissing) {
        textbox.setCustomValidity('Vui lòng nhập dữ liệu');
    } 
    else if(textbox.validity.tooShort) {
        textbox.setCustomValidity('Giá trị nhập quá ngắn');
    }
    else if(textbox.validity.tooLong) {
        textbox.setCustomValidity('Giá trị nhập quá dài');
    }
    else if(textbox.validity.patternMismatch) {
        textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else if(textbox.validity.typeMismatch) {
       textbox.setCustomValidity('Kiểu dữ liệu không đúng');
    }
    else {
        textbox.setCustomValidity('');
    }	
    return true;
};	


