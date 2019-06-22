# R 기초 20190621

love <- 1
print (love)

love <- '안녕하세요'
print (love)

# 주석 
love ('너는 함수가 될 수있을까?')

#love 변수에 print 함수를 지정 
# 데이터프레임, 벡터 등 모든 객체를 변수에 저장가능 
love <- print
love ('함수가 되었다!')

# 객체 설정
love_num <- 1
love_str <- '안녕하세요'
love_vec <- c(1,1,1,1)
love_fun <- print

#str 함수를 통해 객체의 정보를 확인할 수 있음 

str(love_num)
str(love_str)
str(love_vec)
 
#B는 A로부터 지정된 객체
A <- 1
B <- A
print(A)
print(B)

#A값을 변경하더라도 B값은 여전히 1 이다
A <- 9
print (A)
print (B)

print(a)
a <- 1

print(a)
a

#======================================================
#2.3 데이터 구조의 기본 - 벡터 
# 1차원 배열, 요소는 모두 같은 데이터 타입
# 'C' 함수를 통해 생성 (combine)
#=====================================================

 # 1,2,3,4를 요소로 가지는 벡터 생성
vec_t <- c(1,2,3,4)
vec_t

str(vec_t)
length(vec_t)
#벡터를 생성할때 문자와 숫자를 함께 사용한다면? 
vec_t <- c(1, 'hi', 2)
vec_t
str(vec_t)
scalar_item <- 1
scalar_item
vector_item <- c(1)
vector_item
str(scalar_item)
str(vector_item)
identical(scalar_item, vector_item)

#-----------------------------------------
#숫자형 벡터 - 양수, 음수, 소수점 모두 하나의 벡터에 담을 수 있음
numeric_vector <- c(0.2, -1.2, -0.5)
numeric_vector
str(numeric_vector)

n_vector <- c(1,2,3,4,5,6,7,8,9)
min(n_vector)
max(n_vector)
mean(n_vector)
median(n_vector)
sum(n_vector)

numeric_vector <- c(1/0,2/2, -2/2, -1/0, 0/0)
numeric_vector
str(numeric_vector)

# True/False
ex_logical_1 <- c(TRUE, TRUE, FALSE)
ex_logical_1
# mode함수를 통해 벡터의 데이터 타입 확인인
mode(ex_logical_1)
str(ex_logical_1)
mode(numeric_vector)

# T,F로도 설정 가능 
ex_logical_2 <- c(T, F, F)
ex_logical_2
mode(ex_logical_2)

#따옴표를 붙이면 문자열로 인식
ex_logical_4 <- c('TRUE', 'FALSE', 'FALSE')
ex_logical_4
mode(ex_logical_4)
#논리벡터 - TRUE, FALSE, T, F

ex_logical <- c(TRUE, F, T, FALSE)
ex_logical
! ex_logical #!를 붙이면 반대로 출력 
#as.logical : logical변수로 형변환 
ex_logical_7 <- as.logical(c(0, -1, 1, 100, -7))
ex_logical_7 # 0값만 FALSE로 인식 

!ex_logical_7

#as.numeric: 숫자형으로 형변환 , TRUE는 1로, FALSE는 0으로
as.numeric(ex_logical_7)

#문자열 벡터 생성성
v_character <- c('문자열1', '문자열2', 'A', '1')
v_character

#mode함수를 통해 데이터 타입 확인 
mode(v_character)

#문자 개수 출력
nchar(c('F123','A123456'))

#문자열 자르기 = 두번째부터 네번째 문자 사이의 문자열 추출 
substr ('1234567', 2,4)
substr (c('F123', 'A567890','F125'), 1,3)

#특정문자로 데이터 나누기 - split에 정의한 구분자를 기준으로 
#문자열을 나누어 벡터로 변환 

strsplit('2014/10/25',split ='/')

#문자열 합치기 - 합칠 때 문자열 사이의 문자는 sep에 정의
# sep을 정의하지 않으면 문자열 사이에 공백을 붙여 합침 

paste('50', '30', '20', sep = '*')
paste ('50=', '30+','20' )
paste ('50=', '30+','20', sep = '' )


#대문자 변환
toupper ('AbcdeFc')
#소문자 변환 
tolower ('ABEWHXlover')

#팩터로 변환할 문자 벡터 
v_character <- c('사과','복숭아','사과')
v_character
#fcator 함수로 팩터를 생성 - 범주형 데이터(성별, 수강과목, 혈액형, 등급 - 제한된 범주)
# factor(x, levels, ordered) - ordered(서열형), levels(범주)

#팩터란, 범주형 데이터를 표현할 때 사용하는 데이터 타입입니다. 
#예를 들어, 대중소와 같은 순서형(ordinal)팩터나, 남여와 같은 명목형(nominal)팩터

v_factor <- factor (v_character)
v_factor

#--------------------------------------------------------------
#팩터 출력 
v_factor

mode(v_factor) #v_factor의 경우 문자로 출력되나 데이터타입은 숫자 numeric
str(v_factor)

#팩터를 문자 벡터로 변환

v_factor_to_char <- as.character(v_factor)
v_factor_to_char
mode(v_factor_to_char)
v_factor <- factor(v_factor_to_char)
v_factor
mode(v_factor)
str(v_factor)

#팩터를 숫자 벡터로 변환
v_factor <- as.numeric(v_factor)
v_factor

# 팩터로 변환할 문자 벡터 
v_character <- c('사과', '복숭아', '사과', '오렌지', '복숭아')
#factor함수로 팩터 객체 생성
v_factor <- factor(v_character, levels = c('사과', '복숭아'))
v_factor
mode(v_factor)
v_factor  # level값을 주게되면, 전체 character중에 level에 해당되는 값만 력된다
#-----------------------------------------------------
#levels 범주 순서 변경1
v_factor <- factor (v_character, levels = c('사과','복숭아','오렌지'))
v_factor
v_character

v_factor <- factor (v_character, levels = c('복숭아','오렌지', '사과'))
v_factor
#------------------------------------------------------

#등급을 나타내는 문자 벡터

ex_label <- c('하하','중하','중','중상','상상')
#서열형 데이터 팩터 생성 
ordered_factor <- factor(ex_label, ordered = T)
ordered_factor <- factor(ex_label, ordered = F)

ordered_factor # argument를  order로주고  TRUE/T 해주면 서열대로 정렬된다

#-------------------------------------------------------
#levels 입력 항목을 이용해 서열 순으로 범주 순서를 정의 
factor_levels <- factor(ex_label, levels = c('하하','중','상상'), ordered = T)
factor_levels
