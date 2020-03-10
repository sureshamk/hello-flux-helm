cd ./sops/dev/

for file in secrets*.yaml;
  do echo "$file";
  sops -e "$file" >  sops_"$file"
done

