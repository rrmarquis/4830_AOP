public aspect TraceAspect_Marquis {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

   pointcut methodToTrace():  classToTrace() &&  execution(* *(..));

   before(): methodToTrace() {
      System.out.println("[BGN] Method Signature: " + thisJoinPointStaticPart.getSignature() + ", " + //
    		  + thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("[END] File Name: " + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
