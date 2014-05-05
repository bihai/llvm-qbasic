
SET(LLVM_FOUND FALSE)

FIND_PROGRAM(LLVM_CONFIG_EXECUTABLE llvm-config DOC "path to the bison executable")
MARK_AS_ADVANCED(LLVM_CONFIG_EXECUTABLE)

IF(LLVM_CONFIG_EXECUTABLE)
  SET(LLVM_FOUND TRUE)

  execute_process(COMMAND ${LLVM_CONFIG_EXECUTABLE} --cppflags
				OUTPUT_VARIABLE	LLVM_CPPFLAGS
				OUTPUT_STRIP_TRAILING_WHITESPACE
  )
  execute_process(COMMAND ${LLVM_CONFIG_EXECUTABLE}  --libdir
				OUTPUT_VARIABLE	LLVM_LIBDIR
				OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  execute_process(COMMAND ${LLVM_CONFIG_EXECUTABLE} --libs
				OUTPUT_VARIABLE	LLVM_LIBRARIES
				OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  if(UNIX)
	SET(LLVM_LIBRARIES "${LLVM_LIBRARIES} -lpthread -lffi -ldl -lm -lncurses")
  endif()

ENDIF()

