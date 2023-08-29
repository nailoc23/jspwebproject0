package human.test;

public class RPSGame {
	
	// 컴퓨터가 랜덤값 1~3값을 발생하는 함수
	public int RandomRPSNumber() {
		
		int result = 0;
		result = (int)(Math.random()*3)+1;
		return result;
	}
	
	// 사용자와 컴퓨터의 가위바위보를 비교
	public int CompareRPS(int com, int user) {
		int result = 0; // 1 승, 0 무, -1 패
		
		if(com == user) {
			result = 0;
		}else if(user==1) {
			if(com==2) result=-1;
			else result=1;
		}else if(user==2) {
			if(com==3) result=-1;
			else result=1;
		}else if(user==3) {
			if(com==1) result=-1;
			else result=1;
		}
		
		return result;
	}

}
