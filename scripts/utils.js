function hidecopy() {
    var tbxIdValue = document.getElementById('<%= txtCadena.ClientID %>').value;
    var value = document.getElementById('<%= txtCadena.ClientID %>').value.length;
    //document.getElementById('<%= txtCadena.ClientID %>').value = '*';
    var caracter = document.getElementById('<%= txtCadena.ClientID %>').value.substr(value - 1);

    //alert(tbxIdValue);
    if (value < 13) {
        if (caracter.toString() == '*') {
            document.getElementById('<%= CreditCard.ClientID %>').value = document.getElementById('<%= CreditCard.ClientID %>').value.substring(0, document.getElementById('<%= CreditCard.ClientID %>').value.length - 1);
        }
        else {
            document.getElementById('<%= CreditCard.ClientID %>').value += caracter;
        }
        document.getElementById('<%= txtCadena.ClientID %>').value = '';
        var hidencamp = document.getElementById('<%= CreditCard.ClientID %>').value;
        //alert(hidencamp);
        for (i = 0; i < value; i++) {
            document.getElementById('<%= txtCadena.ClientID %>').value += '*';
        }
    }

}