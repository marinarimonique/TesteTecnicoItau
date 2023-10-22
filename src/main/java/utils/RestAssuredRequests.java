package utils;

import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import static io.restassured.RestAssured.given;

public class RestAssuredRequests {
    public static JSONObject lerBodyParaRequest (String nomeDoArquivo) {

        FileReader reader;
        JSONParser jsonParser = new JSONParser();

        {
            try {
                reader = new FileReader(nomeDoArquivo);
                Object obj = jsonParser.parse(reader);

                return new JSONObject(obj.toString());
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public static Response postRequest(JSONObject clienteObjeto) {
        //fake api para realizar teste
        //RestAssured.baseURI = "https://jsonplaceholder.typicode.com";
        RestAssured.baseURI = "https://teste/1.0/elegibilidade_cliente";

        Response response = given()
                .header("Content-type", "application/json")
                .header("Accept", "application/json")
                .and()
                .body(clienteObjeto)
                .when()
                .post("/posts")
                .then()
                .extract().response();

        return response;
    }
}