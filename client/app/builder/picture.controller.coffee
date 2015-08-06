( ->
	angular
		.module 'slidiApp'
		.controller 'PictureRepositoryCtrl', ($scope, $modalInstance, cloudinary, Auth, $http) ->
		  $scope.id = Auth.getCurrentUser()._id

		  $scope.ok = () ->
		    cloudinary.url('vkhrapski'
		    	tags: $scope.id
		    	)
	    $scope.upload = () ->
  			$scope.$watch 'file', (file) ->
				  cloudinary
				  	.upload(file, 
				  		tags: $scope.id
				  	)
				  	.then (resp) ->
				  		alert resp.toString
		  $scope.cancel = () ->
		    $modalInstance.dismiss 'cancel'
)()