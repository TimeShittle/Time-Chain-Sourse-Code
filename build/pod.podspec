Pod::Spec.new do |spec|
  spec.name         = 'Shittle'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/TimeChain/go-TimeChain'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS TimeChain Client'
  spec.source       = { :git => 'https://github.com/TimeChain/go-TimeChain.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/Shittle.framework'

	spec.prepare_command = <<-CMD
    curl https://Shittlestore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/Shittle.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end
