/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.queries;

import java.util.regex.*;

/**
 *
 * @author mario
 */
public class Query {

    /**
     * @param args the command line arguments
     */
    public String getQueryString(String[] args) {
        QueryAnidado actualQuery = null;
        QueryAnidado x = null;
        
        //Para la suma de hora Inicio y fin
        int horaInicio = 0;
        boolean mediaHora = false;
        if(evalua("1?[0-9]",args[0])){
            x = new QueryAnidado("horaInicio",args[0]+":00","VhorariosGrupos");
            horaInicio=Integer.parseInt(args[0]);
            actualQuery=x;
        }else{
            //System.out.println("Hora tiene mal formato "+args[0]);
            //System.exit(-1);
        }
        
        if(evalua("\\+?",args[1])){
            actualQuery.setSearch(actualQuery.getSearch().split(":")[0]+":30");
            mediaHora=true;
        }else if(args[1]==null){
            //No hcaer nada es como decir que no empieza 30 min despues de la hora indicada
        }else{
            //System.out.println("Elemento inesperado "+args[1]);
            //System.exit(-1);
        }
        
        if(evalua("[0-9]",args[2])){
            String horaFinal = calculaFin(horaInicio,mediaHora,Integer.parseInt(args[2]));
            //Creas el anidamiento de Query
            actualQuery.setQuery(new QueryAnidado("horaFin",horaFinal,"VhorariosGrupos"));
            
            //Necesitas la referncia al Query hijo para volver a anidar
            actualQuery=actualQuery.getQuery();
        }else{
           // System.out.println("Hora Final tiene mal formato"+args[2]);
            //System.exit(-1);
        }
        
        //Permite insertar
        if(evalua("((\\s|Lu|Ma|Mi|Ju|Vi)|(Lu|Ma|Mi|Ju|Vi)(,(Lu|Ma|Mi|Ju|Vi))*)",args[3])){
            String[] dias = args[3].split(",");
            
            for(int i =0;i<dias.length;i++){
                actualQuery.setQuery(new QueryAnidado("diaSemana",dameDia(dias[i]),"VhorariosGrupos"));
                actualQuery=actualQuery.getQuery();
            }
        }else if(args[3]==null){
            //No hacer nada, es como pedir que sea cualquier dia
        }else{
            //System.out.println("Error en Dias "+args[3]);
            //System.exit(-1);
        }
        
       if(evalua("(A[1-9][0-9]{3}|CIAP[1-9][0-9]{2})",args[4])){
            actualQuery.setQuery(new QueryAnidado("salon",args[4],"VhorariosGrupos"));
            actualQuery=actualQuery.getQuery();
        }else if(args[4]== null){
            //No hacer nada, es como pedir que sea cualquier dia
        }else{
            //System.out.println("Error en Salon "+args[4]);
            //System.exit(-1);
        }
        
       //Ese Group BY es para eliminar a los Repetidos
       //Todo depende de la implementacion si se va a utilizar o no.
        //System.out.println(x.getQueryString("CRN")+" GROUP BY "+"CRN");
       
       return x.getQueryString("CRN") + " GROUP BY " + "CRN";
    }
    
    public static String example(){
        QueryAnidado x = new QueryAnidado("horaInicio","10:30","VhorariosGrupos");
        QueryAnidado y = new QueryAnidado("horaFin","12:00","VhorariosGrupos");
        QueryAnidado z = new QueryAnidado("salon","A5205","VhorariosGrupos");
        QueryAnidado w = new QueryAnidado("diaSemana","Lunes","VhorariosGrupos");
        QueryAnidado a = new QueryAnidado("diaSemana","Miercoles","VhorariosGrupos");
        x.setQuery(y);
        y.setQuery(z);
        z.setQuery(w);
        w.setQuery(a);
        return x.getQueryString("CRN");
    
    }
    
    public static boolean evalua(String expresion,String evaluacion){
        Pattern p = Pattern.compile(expresion);
        Matcher m;
        m = p.matcher(evaluacion);
        if(m.find()){
            return true;
        }else{
            return false;
        }
    }
    public static String calculaFin(int horaInicio,boolean mediaHora,int mediasHoras){
        int media = mediasHoras%2;
        
        if(mediaHora==true && media == 1){
            horaInicio = horaInicio + 1 + (int)(mediasHoras-1)/2;
            return horaInicio+":00";
        }else if(media == 1){
            horaInicio = horaInicio + (int)mediasHoras-1/2;
            return horaInicio+":30";
        }else if(mediaHora == true){
            horaInicio = horaInicio + (int)mediasHoras/2;
            return horaInicio+":30";
        }else{
            return (horaInicio + (int)mediasHoras/2)+":00";
        }
    }

    private static String dameDia(String string) {
        if(string.equals("Lu"))
            return "Lunes";
        if(string.equals("Ma"))
            return "Martes";
        if(string.equals("Mi"))
            return "Miercoles";
        if(string.equals("Ju"))
            return "Jueves";
        if(string.equals("Vi"))
            return "Viernes";
        if(string.equals("Sa"))
            return "Sabado";
        if(string.equals("Do"))
            return "Domingo";
        
        return "";
    }
}