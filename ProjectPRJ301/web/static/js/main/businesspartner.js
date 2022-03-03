/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function deleteCustomer(id)
{
    var result = confirm("Bạn chắc chắn muốn xóa Khách hàng" + id+" này chứ?");
    if(!result){
        window.location.href = "deletecustomer?id="+id;
    }
}

