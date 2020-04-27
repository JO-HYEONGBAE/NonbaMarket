package com.spring.common.log;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j


@Component

//해당클래스의객체가 aspect를 구현함 것임으로 나타내기위해서 사용
@Aspect
public class LoggerAdvice {

	//execution(@execution) 메서드를 기준으로 PotinCut을 설정
	/*
	 * @Before("execution(* com.spring..*Impl.*(..))") public void printLogging() {
	 * log.info("----------------------------");
	 * log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
	 * log.info("----------------------------"); }
	 */
	
	/*
	 * @Before("execution(* com.spring..*Impl.*(..)) && args(avo)") public void
	 * printLogging(AdminMemberVO avo) { log.info("----------------------------");
	 * log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
	 * log.info("----------------------------"); log.info("adminMemberVO" +avo); }
	 */
	
	@Before("execution(* com.spring..*Impl.*(..))")
	public void printLogging(JoinPoint jp) {
		log.info("----------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		
		log.info("[호출 메서드명]"+jp.getSignature().getName());
		log.info("[호출 메서드의 파라미터 값]"+Arrays.toString(jp.getArgs()));
		log.info("----------------------------");
	}
	
	@AfterThrowing(pointcut="execution(* com.spring..*Impl.*(..))", throwing = "exception")
	public void exceptionLogging(JoinPoint jp, Throwable exception) {
		log.info("--------------------");
		log.info("[예외발생]");
		log.info("[예외발생 메서드명]"+jp.getSignature().getName());
		
		log.info("[예외 메시지]"+exception);
		log.info("--------------------");
		
		
	}
	
	@AfterReturning(pointcut="execution(* com.spring..service.*Impl.*(..))",
			returning = "returnValue")
	public void afterReturningMethod(JoinPoint jp,Object returnValue) {
		log.info("------------------------------");
		log.info("[공통 로그 log] 비즈니스로직 수행후 동작");
		log.info("afterReturningMethod() called....."+ jp.getSignature().getName());
		log.info("[리턴 결과]"+ returnValue);
		log.info("------------------------------");
		
		
	}
	
}
