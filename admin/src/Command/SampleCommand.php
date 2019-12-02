<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class SampleCommand extends Command
{
    protected static $defaultName = 'app:sample';

    protected function configure()
    {
        $this->setDescription('Sample command');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $message = 'hello';
        $output->writeln($message);
    }
}