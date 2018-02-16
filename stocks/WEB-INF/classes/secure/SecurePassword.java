package secure;
import java.security.*;


public class SecurePassword{
	
	private static String hashResult;

	public static String hashPassword(String password){
		try{
			hashResult = getHash(password, getSalt());
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}catch(NoSuchProviderException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		return hashResult;
	}
	
	private static String getHash(String password, byte[] salt){
		String hashedPassword = null;
		
		try{
			MessageDigest passwordDigest = MessageDigest.getInstance("MD5");

			passwordDigest.update(salt);

			byte[] messageBytes = passwordDigest.digest(password.getBytes());

			StringBuilder byteString = new StringBuilder();
			for(int i=0; i< messageBytes.length ;i++)
			{
				byteString.append(Integer.toString((messageBytes[i] & 0xff) + 0x100, 16).substring(1));
			}

			hashedPassword = byteString.toString();
		}catch (NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		
		return hashedPassword;
	}


	private static byte[] getSalt() throws NoSuchAlgorithmException, NoSuchProviderException{
		SecureRandom randomBit = SecureRandom.getInstance("SHA1PRNG", "SUN");

		byte[] salt = new byte[16];

		randomBit.nextBytes(salt);

		return salt;
	}
}