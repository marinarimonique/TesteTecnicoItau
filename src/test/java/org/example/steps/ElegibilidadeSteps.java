package org.example.steps;

import io.cucumber.java.pt.*;
import io.restassured.response.Response;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.jupiter.api.Assertions;
import utils.RestAssuredRequests;

public class ElegibilidadeSteps {
    JSONObject body;
    JSONObject clientes;
    JSONArray contratos;
    Response response;

    @Dado("que desejo validar se o cliente é elegivel")
    public void que_desejo_validar_a_elegibilidade_de_um_cliente() {
        body = RestAssuredRequests.lerBodyParaRequest("src/main/java/json/request.json");
        clientes = body.getJSONObject("elegibilidade_cliente_entrada");
        contratos = clientes.getJSONArray("contratos");
    }

    @E("o campo {string} preenchido com valor {string}")
    public void o_campo_preenchido_com_valor(String nomeDoCampo, String valorDoCampo) {
        if (nomeDoCampo.equals("indicador_conta_ativa")) {
            contratos.getJSONObject(0).put(nomeDoCampo, valorDoCampo);
        } else {
            contratos.getJSONObject(0).put(nomeDoCampo, valorDoCampo);
        }
    }

    @E("o campo {string} preenchido com {string}")
    public void o_campo_preenchido_com(String nomeDoCampo, String valorDoCampo) {
        if (nomeDoCampo.equals("codigo_tipo_produto_oferta")) {
            contratos.getJSONObject(0).put(nomeDoCampo, valorDoCampo);
        } else {
            contratos.getJSONObject(0).put(nomeDoCampo, valorDoCampo);
        }
    }

    @Quando("realizar a requisicao na aplicacao de elegibilidade")
    public void realizar_a_requisicao_na_aplicacao_de_elegibilidade() {
        response = RestAssuredRequests.postRequest(body);
    }

    @Entao("a API ira retornar código {int} e mensagem negativa")
    public void a_api_ira_retornar_código_e_mensagem_negativa(Integer statusCode) {
        Assertions.assertEquals(response.getStatusCode(), statusCode);
        Assertions.assertEquals(response.getBody().asString(), "{\n" +
                "  \"elegibilidade_cliente_saida\": {\n" +
                "    \"indicador_elegibilidade_cliente\": \"N\"\n" +
                "  }\n" +
                "}");
    }

    @Entao("a API ira retornar código {int} e mensagem positiva")
    public void a_api_ira_retornar_código_e_mensagem_positiva(Integer statusCode) {
        Assertions.assertEquals(response.getStatusCode(), statusCode);
        Assertions.assertEquals(response.getBody().asString(), "{\n" +
                "  \"elegibilidade_cliente_saida\": {\n" +
                "    \"indicador_elegibilidade_cliente\": \"S\"\n" +
                "  }\n" +
                "}");
    }

    @Dado("que desejo validar a elegibilidade de um cliente com mais de um contrato")
    public void queDesejoValidarAElegibilidadeDeUmClienteComMaisDeUmContrato() {
        body = RestAssuredRequests.lerBodyParaRequest("src/main/java/json/request_contracts.json");
    }

    @Dado("que desejo validar a não elegibilidade de um cliente com mais de um contrato")
    public void queDesejoValidarANãoElegibilidadeDeUmClienteComMaisDeUmContrato() {
        body = RestAssuredRequests.lerBodyParaRequest("src/main/java/json" +
                "/request_contracts_negative.json");
    }

    //    @Entao("a API ira retornar código {int} e {string} igual {string}")
//    public void a_api_ira_retornar_código_e_s(Integer statusCode, String nomeDoCampo, String mensagemDeRetorno) {
//        Assertions.assertEquals(statusCode, response.getStatusCode());
//        JSONObject abc = response.getBody().jsonPath().get("elegibilidade_cliente_saida");
//        Assertions.assertEquals(abc.getString(nomeDoCampo), mensagemDeRetorno);
//    }
}