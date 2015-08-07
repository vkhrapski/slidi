( ->
	angular
		.module 'slidiApp'
		.controller 'PictureModalCtrl', ($scope, $modalInstance, cloudinary, Auth, User) ->
		  $scope.setActive = (index) ->
  			$scope.active = index
        
		  $scope.upload = () ->
  			$scope.$watch 'file', (file) ->
				  cloudinary
				  	.upload(file, 
				  		tags: $scope.id
				  	)
				  	.then (resp) ->
				  		$scope.list()
	  	
	  	$modalInstance.opened.then ->
        $scope.list()
		  
		  $scope.id = Auth.getCurrentUser()._id

		  $scope.ok = () ->
		  	if $scope.active?
		  		$modalInstance.close $scope.resources[$scope.active].url
	  		else 
	  			$scope.cancel()

		  $scope.cancel = () ->
		    $modalInstance.dismiss 'cancel'
			
    	$scope.list = () ->
	    	User.getPictures().$promise.then(
			    (data) ->
			    	$scope.resources = data.resources
	    	)
)()