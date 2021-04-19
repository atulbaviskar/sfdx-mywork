public class ParkLocator {
    public static list<string> country(string sty){
        ParkService.ParksImplPort contry = new ParkService.ParksImplPort();
        list<string> lstparkNameByCountry = contry.byCountry(sty);
        return lstparkNameByCountry;
    }
}