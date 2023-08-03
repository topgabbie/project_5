function autogit(){
 
 git status

 git add .

 echo input your commit message 

 read "m"

 git commit -m $m

 git push origin master        


}
autogit

