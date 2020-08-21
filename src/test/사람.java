package test;

public class 사람 implements 액션 {
	public String 이름;
	public int 나이;

	public 사람(String 이름, int 나이) {
		this.이름 = 이름;
		this.나이 = 나이;
	}

	@Override
	public void 먹다() {
		System.out.println(이름 + "이 밥을 먹습니다.");

	}

	@Override
	public void 걷다() {
		System.out.println(이름 + "이 걷습니다.");
	}

	@Override
	public void 자다() {
		System.out.println(이름 + "이 잡니다.");
	}
}
