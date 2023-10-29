package save_lives_2021_2022;


public class NeedLogin {

    public void needLogin() throws Exception{
        try {
            throw new Exception("Απαιτείται σύνδεση για πρόσβαση σε αυτή τη σελίδα");
        } catch (Exception e){
            throw new Exception (e.getMessage());
        } finally {
        }
    }

}