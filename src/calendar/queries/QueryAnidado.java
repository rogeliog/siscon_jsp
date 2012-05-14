/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.queries;

public class QueryAnidado {
    private String search; //Lo que se buscara en el query
    private String attribute;//Atributo en el que se basara el Query
    private String table; //Tabla a la que correspondera la consulta
    private QueryAnidado query;
    
    public QueryAnidado(String attribute,String search,String table){
        this.search= search;
        this.attribute = attribute;
        this.table = table;
        query = null;
    }
    public QueryAnidado(){
        query = null;
        search="";
        attribute="";
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public QueryAnidado getQuery() {
        return query;
    }

    public void setQuery(QueryAnidado query) {
        this.query = query;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }
    
    public String getQueryString(String column){
        
        return "SELECT "+column+
                " FROM "+table +
                " WHERE "+attribute+
                "='"+search+"' "+
                (query!= null ? 
                "AND "+column+" IN ("+query.getQueryString(column)+")"
                :"");
    }
}