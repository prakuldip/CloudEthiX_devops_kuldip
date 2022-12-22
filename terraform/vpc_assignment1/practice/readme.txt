both practice1.txt and practice2.txt works fine.

You have to create aws_route_table_association resource to associate route table to subnet.
You can place route inside the aws_route_table resource as route attribute or 
you can create separate aws_route resource. Both work fine.

