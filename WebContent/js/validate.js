//扩展easyui表单的验证    
$.extend($.fn.validatebox.defaults.rules, {    
    //验证汉字    
    CHS: {    
        validator: function (value) {    
            return /^[\u0391-\uFFE5]+$/.test(value);    
        },    
        message: '请输入正确的名字.'    
    },    
    Mobile: {//value值为文本框中的值    
        validator: function (value) {
        	var reg = /^1[0-9]{10}$/;
            return reg.test(value);    
        },    
        message: '请输入正确的号码.'    
    },    
    //国内邮编验证    
    ZipCode: {    
        validator: function (value) {    
            var reg = /^[0-9]\d{5}$/;    
            return reg.test(value);    
        },    
        message: 'The zip code must be 6 digits and 0 began.'    
    },    
  //数字    
    Number: {    
        validator: function (value) {    
            var reg =/^[0-9]*$/;    
            return reg.test(value);    
        },    
        message: '请输入数字.'    
    },    
     //非负整数  
    Integer: {  
        validator: function (value) {  
            var reg = /^[1-9]\d*|0$/;  
            return reg.test(value);  
        },   
        message: '请输入非负的值.'  
    },  
    
    DateValidator:{
    	 validator: function (value, param) {  
    		  var d1 = $(''+param[0]+'').datebox('getValue')  
              return value >= d1;  
         },   
         message: '结束时间必须大于或等于开始时间'
    },
    //邮箱验证/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
    Email:{  
        validator: function (value) {  
            var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;  
            return reg.test(value);  
        },   
        message: '邮箱格式错误'  
    },  
    //编号/^[0-9]\d{1,10}/ 
    IDValidator:{  
        validator: function (value) {  
            var reg = /^[0-9]{1,10}$/;  
            return reg.test(value);  
        },   
        message: '1~10位数字组成'  
    }, 
    //密码/^[a-z0-9_-]{6,18}$/
    PasswordValidator:{  
        validator: function (value) {  
            var reg = /^[a-z0-9_-]{6,18}$/;  
            return reg.test(value);  
        },   
        message: '6~18位字符组成'  
    }, 
})    