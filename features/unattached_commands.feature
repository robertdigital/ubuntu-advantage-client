Feature: Command behaviour when unattached

    Scenario: Unattached detach in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua detach` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua detach` with sudo
        Then I will see the following on stderr:
            """
            This machine is not attached to a UA subscription.
            See https://ubuntu.com/advantage
            """

    Scenario: Unattached refresh in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua refresh` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua refresh` with sudo
        Then I will see the following on stderr:
            """
            This machine is not attached to a UA subscription.
            See https://ubuntu.com/advantage
            """

    Scenario: Unattached enable of a known service in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua enable livepatch` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua enable livepatch` with sudo
        Then I will see the following on stderr:
            """
            To use 'livepatch' you need an Ubuntu Advantage subscription
            Personal and community subscriptions are available at no charge
            See https://ubuntu.com/advantage
            """

    Scenario: Unattached enable of an unknown service in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua enable foobar` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua enable foobar` with sudo
        Then I will see the following on stderr:
            """
            Cannot enable 'foobar'
            For a list of services see: sudo ua status
            """

    Scenario: Unattached disable of a known service in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua disable livepatch` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua disable livepatch` with sudo
        Then I will see the following on stderr:
            """
            To use 'livepatch' you need an Ubuntu Advantage subscription
            Personal and community subscriptions are available at no charge
            See https://ubuntu.com/advantage
            """

    Scenario: Unattached disable of an unknown service in a trusty lxd container
        Given a trusty lxd container with ubuntu-advantage-tools installed
        When I run `ua disable foobar` as non-root
        Then I will see the following on stderr:
            """
            This command must be run as root (try using sudo)
            """
        When I run `ua disable foobar` with sudo
        Then I will see the following on stderr:
            """
            Cannot disable 'foobar'
            For a list of services see: sudo ua status
            """
