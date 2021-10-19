$(document).ready(function(){
    $("#cep").change(function(){
        $.ajax("https://viacep.com.br/ws/" + this.value + "/json/").done(function(data){
            $("#logradouro").val(data.logradouro);
            $("#complemento").val(data.complemento);
            $("#bairro").val(data.bairro);
            $("#localidade").val(data.localidade);
            $("#uf").val(data.uf);
        }).fail(function(){
            alert("Error");
        });
    });
});